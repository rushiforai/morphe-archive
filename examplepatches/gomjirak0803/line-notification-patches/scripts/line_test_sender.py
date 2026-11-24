"""Local LINE Messaging API test sender (GUI + CLI); optional credentials stay in .tools/."""
from __future__ import annotations

import argparse
import getpass
import json
import math
from pathlib import Path
import queue
import re
import threading
import urllib.error
import urllib.request
import uuid
from dataclasses import dataclass
from datetime import datetime


CREDS_PATH = Path(__file__).resolve().parents[1] / ".tools" / "line-bot-creds.json"
PUSH_URL = "https://api.line.me/v2/bot/message/push"
KINDS = {
    "짧은 글": "short",
    "긴 글": "long",
    "줄바꿈": "lines",
    "혼합": "mixed",
    "위치 공유": "location",
    "스티커": "sticker",
    "@멘션 (본인)": "mention",
    "@All 멘션 (그룹)": "mention_all",
    "기능 묶음 (위치·스티커·멘션)": "features",
    "직접 입력": "custom",
}
ALL_KINDS = tuple(KINDS.values())
ERROR_HINTS = {
    400: "User ID와 메시지 설정을 확인하세요. (@멘션/textV2는 1:1 봇 방(U...)에서는 거절되며 그룹 방(C...)이 필요합니다.)",
    401: "Channel access token이 올바른지, 만료·폐기되지 않았는지 확인하세요.",
    403: "채널 권한과 발송 IP 제한 설정을 확인하세요.",
    429: "발송 한도 또는 요청 횟수 제한을 확인하세요.",
}


class SendError(Exception):
    """Sanitized error safe to display without response bodies or credentials."""


@dataclass(frozen=True, repr=False)
class Credentials:
    token: str
    user_id: str


def credentials(token: str, user_id: str) -> Credentials:
    token, user_id = token.strip(), user_id.strip()
    if not token or not token.isascii() or any(ord(c) < 33 or ord(c) > 126 for c in token):
        raise ValueError("공백·줄바꿈 없는 Channel access token을 입력하세요.")
    if not re.fullmatch(r"U[0-9a-f]{32}", user_id):
        raise ValueError("Basic settings의 Your user ID를 입력하세요. U로 시작하는 33자리이며 친구 검색용 LINE ID와 다릅니다.")
    return Credentials(token, user_id)


def validate_group_id(group_id: str) -> str:
    gid = (group_id or "").strip()
    if not gid:
        return ""
    if not re.fullmatch(r"C[0-9a-f]{32}", gid):
        raise ValueError("테스트 그룹 ID는 C로 시작하는 33자리여야 합니다.")
    return gid


def save_creds(token: str, user_id: str, group_id: str = "", path: Path = CREDS_PATH) -> None:
    creds = credentials(token, user_id)
    gid = validate_group_id(group_id)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps({"token": creds.token, "user_id": creds.user_id, "group_id": gid}, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )


def load_creds(path: Path = CREDS_PATH) -> tuple[Credentials, str]:
    if not path.is_file():
        raise ValueError(f"저장된 토큰 파일이 없습니다: {path}")
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise ValueError("저장된 토큰 파일을 읽지 못했습니다.") from error
    if not isinstance(data, dict):
        raise ValueError("저장된 토큰 파일 형식이 올바르지 않습니다.")
    return credentials(str(data.get("token", "")), str(data.get("user_id", ""))), validate_group_id(str(data.get("group_id", "")))


def delete_creds(path: Path = CREDS_PATH) -> bool:
    if path.is_file():
        path.unlink()
        return True
    return False


def make_messages(count: int, kind: str, run_id: str, user_id: str | None = None,
                  custom_text: str | None = None, location_title: str | None = None,
                  location_address: str | None = None) -> list[dict]:
    if not 1 <= count <= 26:
        raise ValueError("한 번에 1~26개를 선택하세요.")
    if kind not in ALL_KINDS:
        raise ValueError("지원하지 않는 내용 유형입니다.")
    if kind in {"mention", "features"} and not re.fullmatch(r"U[0-9a-f]{32}", user_id or ""):
        raise ValueError("@멘션 테스트에는 유효한 Your user ID (U...)가 필요합니다.")
    if kind == "custom" and not (custom_text or "").strip():
        raise ValueError("직접 입력 메시지 내용을 입력하세요.")
    result = []
    for i in range(1, count + 1):
        if kind == "mixed":
            selected = ("short", "long", "lines")[(i - 1) % 3]
        elif kind == "features":
            selected = ("location", "sticker", "mention")[(i - 1) % 3]
        else:
            selected = kind
        if selected == "location":
            title = (location_title or "").strip() or f"강남역 테스트 위치 ({i}/{count})"
            address = (location_address or "").strip() or "서울특별시 강남구 강남대로 396"
            result.append({
                "type": "location",
                "title": title,
                "address": address,
                "latitude": 37.497942,
                "longitude": 127.027621,
            })
        elif selected == "sticker":
            result.append({"type": "sticker", "packageId": "446", "stickerId": "1988"})
        elif selected == "mention":
            result.append({
                "type": "textV2",
                "text": f"{{me}} [알림 시험 {run_id}] {i}/{count} @멘션 예외 알림 테스트입니다.",
                "substitution": {
                    "me": {"type": "mention", "mentionee": {"type": "user", "userId": user_id}},
                },
            })
        elif selected == "mention_all":
            result.append({
                "type": "textV2",
                "text": f"{{all}} [알림 시험 {run_id}] {i}/{count} @All 멘션 테스트입니다.",
                "substitution": {
                    "all": {"type": "mention", "mentionee": {"type": "all"}},
                },
            })
        elif selected == "custom":
            base = (custom_text or "").strip()
            result.append({"type": "text", "text": base if count == 1 else f"{base} ({i}/{count})"})
        else:
            prefix = f"[알림 시험 {run_id}] {i}/{count}"
            if selected == "long":
                body = "긴 본문의 자동 줄바꿈을 확인합니다. 같은 발신자의 내용이 잘 묶이는지, 마지막 문장까지 자연스럽게 이어지는지 펼친 알림에서 확인해 주세요. " * 3
            elif selected == "lines":
                body = "첫 번째 줄: 보낸 사람과 숫자를 확인합니다.\n두 번째 줄: 명시적 줄바꿈을 확인합니다.\n세 번째 줄: 마지막 줄입니다."
            else:
                body = "짧은 테스트 메시지입니다."
            result.append({"type": "text", "text": prefix + "\n" + body})
    return result


def batches(messages: list[dict], size: int) -> list[list[dict]]:
    if size not in (1, 5):
        raise ValueError("묶음 크기는 1 또는 5여야 합니다.")
    return [messages[i:i + size] for i in range(0, len(messages), size)]


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        # Never forward the bearer credential to a redirect target.
        raise SendError("예상하지 못한 API 리디렉션으로 중단했습니다.")


def push(creds: Credentials, messages: list[dict], *, opener=None, to: str | None = None) -> None:
    if not 1 <= len(messages) <= 5:
        raise ValueError("요청 하나에는 메시지 1~5개가 필요합니다.")
    recipient = creds.user_id if to is None else to.strip()
    if not re.fullmatch(r"[UC][0-9a-f]{32}", recipient):
        raise ValueError("수신 대상 ID(U... 또는 C...)가 올바르지 않습니다.")
    body = json.dumps({"to": recipient, "messages": messages, "notificationDisabled": False},
                      ensure_ascii=False).encode("utf-8")
    request = urllib.request.Request(PUSH_URL, data=body, method="POST", headers={
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer " + creds.token,
        "X-Line-Retry-Key": str(uuid.uuid4()),
    })
    client = opener if opener is not None else urllib.request.build_opener(NoRedirect())
    try:
        with client.open(request, timeout=25) as response:
            if response.status != 200:
                raise SendError("예상하지 못한 API 상태로 중단했습니다. 자동 재전송하지 않습니다.")
            # No response body or request/recipient identifiers are logged.
    except urllib.error.HTTPError as error:
        status = error.code
        error.close()
        raise SendError(f"HTTP {status}: " + ERROR_HINTS.get(status, "API 오류로 중단했습니다. 자동 재전송하지 않습니다.")) from None
    except (urllib.error.URLError, TimeoutError, OSError):
        raise SendError("연결·응답 확인에 실패했습니다. 이미 전달됐을 수도 있어 자동 재전송하지 않습니다.") from None


def send_sequence(creds, messages, batch_size, delay, interval, stop, emit, *, send=push, to: str | None = None):
    try:
        if not 0 <= delay <= 300 or not 0.5 <= interval <= 30:
            raise ValueError("시작 대기는 0~300초, 요청 간격은 0.5~30초로 설정하세요.")
        chunks = batches(messages, batch_size)
        emit(f"{delay:g}초 뒤 시작합니다. 메시지 {len(messages)}개 / API 요청 {len(chunks)}회")
        if stop.wait(delay):
            emit("발송 전에 취소했습니다.")
            return
        accepted = 0
        for i, chunk in enumerate(chunks):
            if stop.is_set():
                emit("중단했습니다. 이미 접수한 메시지는 취소되지 않습니다.")
                return
            if to is None:
                send(creds, chunk)
            else:
                send(creds, chunk, to=to)
            accepted += len(chunk)
            emit(f"API 요청 {i + 1}/{len(chunks)} 접수 — 메시지 누계 {accepted}개")
            if i + 1 < len(chunks) and stop.wait(interval):
                emit("중단했습니다. 이미 접수한 메시지는 취소되지 않습니다.")
                return
        emit("API 접수 완료. 실제 수신·미확인 수는 휴대폰에서 확인하세요.")
    except (ValueError, SendError) as error:
        emit(str(error))
    except Exception:
        # Never expose an exception repr that could contain a request or credentials.
        emit("발송 도중 오류가 발생했습니다. 일부 전달됐을 수 있으며 자동 재전송하지 않습니다.")


def show_window():
    import tkinter as tk
    from tkinter import messagebox, ttk

    root = tk.Tk()
    root.title("LINE 테스트 메시지 보내기")
    root.minsize(650, 520)
    frame = ttk.Frame(root, padding=18)
    frame.pack(fill="both", expand=True)
    frame.columnconfigure(1, weight=1)
    ttk.Label(frame, text="본인에게 보낼 테스트 메시지", font=("맑은 고딕", 15, "bold")).grid(row=0, column=0, columnspan=3, sticky="w", pady=(0, 12))
    ttk.Label(frame, text="공식 계정을 친구 추가한 뒤 사용하세요. 저장 시 .tools/line-bot-creds.json에만 보관됩니다.").grid(row=1, column=0, columnspan=3, sticky="w", pady=(0, 12))
    ttk.Label(frame, text="Channel access token").grid(row=2, column=0, sticky="w", padx=(0, 12))
    token = ttk.Entry(frame, show="•")
    token.grid(row=2, column=1, columnspan=2, sticky="ew", pady=5)
    ttk.Label(frame, text="Your user ID").grid(row=3, column=0, sticky="w")
    user_id = ttk.Entry(frame)
    user_id.grid(row=3, column=1, columnspan=2, sticky="ew", pady=5)
    saved_group_id = ""
    try:
        loaded_creds, saved_group_id = load_creds()
        token.insert(0, loaded_creds.token)
        user_id.insert(0, loaded_creds.user_id)
    except ValueError:
        pass
    ttk.Label(frame, text="메시지 개수").grid(row=4, column=0, sticky="w")
    count = tk.StringVar(value="1")
    ttk.Spinbox(frame, from_=1, to=26, textvariable=count, width=8).grid(row=4, column=1, sticky="w", pady=5)
    presets = ttk.Frame(frame)
    presets.grid(row=4, column=2, sticky="e")
    for value in (1, 2, 3, 26):
        ttk.Button(presets, text=f"{value}개", width=5, command=lambda v=value: count.set(str(v))).pack(side="left", padx=2)
    ttk.Label(frame, text="내용 유형").grid(row=5, column=0, sticky="w")
    kind = ttk.Combobox(frame, values=list(KINDS), state="readonly")
    kind.set("혼합")
    kind.grid(row=5, column=1, sticky="ew", pady=5)
    ttk.Label(frame, text="발송 방식").grid(row=6, column=0, sticky="w")
    batching = ttk.Combobox(frame, values=["최대 5개씩 묶음", "한 개씩 순차 발송"], state="readonly")
    batching.current(0)
    batching.grid(row=6, column=1, sticky="ew", pady=5)
    ttk.Label(frame, text="시작 대기 / 요청 간격(초)").grid(row=7, column=0, sticky="w")
    timing = ttk.Frame(frame)
    timing.grid(row=7, column=1, sticky="w", pady=5)
    delay = ttk.Spinbox(timing, from_=0, to=300, width=7)
    delay.set("10")
    delay.pack(side="left", padx=(0, 8))
    interval = ttk.Spinbox(timing, from_=0.5, to=30, increment=0.5, width=7)
    interval.set("1")
    interval.pack(side="left")
    ttk.Label(frame, text="직접 입력 문구").grid(row=8, column=0, sticky="w")
    custom_entry = ttk.Entry(frame)
    custom_entry.grid(row=8, column=1, columnspan=2, sticky="ew", pady=5)
    ttk.Label(frame, text="공식 계정의 발송 한도가 사용됩니다. 한 개씩 보내면 API 요청 횟수가 늘어납니다.").grid(row=9, column=0, columnspan=3, sticky="w", pady=8)
    events = queue.Queue()
    stop = threading.Event()
    busy = False
    status = tk.StringVar(value="아직 발송하지 않았습니다.")
    ttk.Label(frame, textvariable=status, wraplength=600).grid(row=11, column=0, columnspan=3, sticky="w", pady=12)

    def start():
        nonlocal busy
        if busy:
            return
        try:
            creds = credentials(token.get(), user_id.get())
            messages = make_messages(
                int(count.get()), KINDS[kind.get()], datetime.now().strftime("%H%M%S"),
                creds.user_id, custom_text=custom_entry.get(),
            )
            size = 5 if batching.current() == 0 else 1
            wait, gap = float(delay.get()), float(interval.get())
            if not 0 <= wait <= 300 or not 0.5 <= gap <= 30:
                raise ValueError("시작 대기는 0~300초, 요청 간격은 0.5~30초로 설정하세요.")
        except (ValueError, KeyError) as error:
            messagebox.showerror("입력 확인", str(error), parent=root)
            return
        busy = True
        stop.clear()
        send_button.configure(state="disabled")
        cancel_button.configure(state="normal")

        def work():
            try:
                send_sequence(creds, messages, size, wait, gap, stop, events.put)
            finally:
                events.put(None)
        threading.Thread(target=work, daemon=True).start()

    def save_local():
        try:
            save_creds(token.get(), user_id.get(), saved_group_id)
            status.set(f".tools/{CREDS_PATH.name}에 저장했습니다. (삭제 요청 전까지 유지)")
        except ValueError as error:
            messagebox.showerror("입력 확인", str(error), parent=root)

    buttons = ttk.Frame(frame)
    buttons.grid(row=10, column=0, columnspan=3, sticky="ew", pady=5)
    send_button = ttk.Button(buttons, text="테스트 메시지 보내기", command=start)
    send_button.pack(side="left", padx=(0, 10))
    cancel_button = ttk.Button(buttons, text="중단", state="disabled", command=stop.set)
    cancel_button.pack(side="left", padx=(0, 10))
    ttk.Button(buttons, text="토큰·ID 로컬 저장 (.tools)", command=save_local).pack(side="left")

    def poll():
        nonlocal busy
        try:
            while True:
                event = events.get_nowait()
                if event is None:
                    busy = False
                    send_button.configure(state="normal")
                    cancel_button.configure(state="disabled")
                else:
                    status.set(event)
        except queue.Empty:
            pass
        root.after(100, poll)

    def close():
        stop.set()
        token.delete(0, "end")
        user_id.delete(0, "end")
        root.destroy()
    root.protocol("WM_DELETE_WINDOW", close)
    poll()
    root.mainloop()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dry-run", action="store_true", help="Build synthetic messages only; no credentials/network")
    parser.add_argument("--save-creds", action="store_true", help="Prompt and save Channel token / User ID to .tools/")
    parser.add_argument("--check-creds", action="store_true", help="Print JSON status of .tools/line-bot-creds.json without secrets")
    parser.add_argument("--delete-creds", action="store_true", help="Delete saved .tools/line-bot-creds.json")
    parser.add_argument("--send", action="store_true", help="Send test messages via CLI using saved .tools/ credentials")
    parser.add_argument("--count", type=int, default=1)
    parser.add_argument("--kind", choices=list(ALL_KINDS), default="mixed")
    parser.add_argument("--batch-size", type=int, choices=[1, 5], default=5)
    parser.add_argument("--delay", type=float, default=0.0)
    parser.add_argument("--interval", type=float, default=1.0)
    parser.add_argument("--target", choices=["user", "group"], default="user")
    parser.add_argument("--text", help="Custom message body for --kind custom")
    parser.add_argument("--title", help="Location title override for --kind location")
    parser.add_argument("--address", help="Location address override for --kind location")
    args = parser.parse_args()

    if args.save_creds:
        tok = getpass.getpass("Channel access token: ")
        uid = input("Your user ID (U...): ")
        gid = input("Test group ID (C..., optional): ")
        save_creds(tok, uid, gid)
        print(json.dumps({"saved": True, "path": ".tools/line-bot-creds.json", "hasGroupId": bool(gid.strip())}))
        return

    if args.check_creds:
        configured = False
        has_group = False
        try:
            _, gid = load_creds()
            configured = True
            has_group = bool(gid)
        except ValueError:
            pass
        print(json.dumps({"configured": configured, "path": ".tools/line-bot-creds.json", "hasGroupId": has_group}))
        return

    if args.delete_creds:
        deleted = delete_creds()
        print(json.dumps({"deleted": deleted, "path": ".tools/line-bot-creds.json"}))
        return

    if args.dry_run:
        messages = make_messages(
            args.count, args.kind, "DRY-RUN", "U" + "0" * 32,
            custom_text=args.text, location_title=args.title, location_address=args.address,
        )
        print(json.dumps({"networkUsed": False, "credentialsRead": False, "messages": len(messages),
                          "apiRequestsIfSent": math.ceil(len(messages) / args.batch_size),
                          "preview": messages[0].get("text") or messages[0]}, ensure_ascii=False, indent=2))
        return

    if args.send:
        creds, group_id = load_creds()
        target_id = None
        if args.target == "group":
            if not group_id:
                raise SystemExit("그룹 ID(C...)가 저장되어 있지 않습니다. .tools/line-bot-creds.json에 group_id를 설정하세요.")
            target_id = group_id
        messages = make_messages(
            args.count, args.kind, datetime.now().strftime("%H%M%S"), creds.user_id,
            custom_text=args.text, location_title=args.title, location_address=args.address,
        )
        failures = []
        def emit(msg: str) -> None:
            print(msg, flush=True)
            if msg.startswith("HTTP ") or "실패" in msg or "중단" in msg or "오류" in msg:
                failures.append(msg)
        send_sequence(creds, messages, args.batch_size, args.delay, args.interval,
                      threading.Event(), emit, to=target_id)
        if failures:
            raise SystemExit(1)
        return

    show_window()


if __name__ == "__main__":
    main()
