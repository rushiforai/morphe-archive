from __future__ import annotations

import json
import os
import shutil
import subprocess
from pathlib import Path

import questionary

from apk_lab.google_play_accounts import (
    GooglePlayAccount,
    GooglePlayAccountError,
    GooglePlayAccountsFile,
    load_google_play_accounts,
    save_google_play_accounts,
)
from apk_lab.models import ExitCode


def resolve_apkeep_binary() -> str | None:
    env_bin = os.environ.get("APKEEP_BIN")
    if env_bin and Path(env_bin).is_file() and os.access(env_bin, os.X_OK):
        return env_bin

    # Check APK Lab cache
    cache_root = (
        Path.home() / ".cache" / "aidans-patches" / "apk-lab" / "tools" / "apkeep"
    )
    if cache_root.exists():
        for candidate in cache_root.glob("**/apkeep"):
            if candidate.is_file() and os.access(candidate, os.X_OK):
                return str(candidate)

    # PATH
    return shutil.which("apkeep")


def exchange_oauth_for_aas(email: str, oauth_token: str) -> str:
    apkeep_bin = resolve_apkeep_binary()
    if not apkeep_bin:
        print("\nNotice: apkeep executable not found on host/cache.")
        print("You can exchange manually with:")
        print(f"  apkeep -e {email} --oauth-token [OAUTH_TOKEN]")
        aas = questionary.password("Or enter pre-generated AAS token:").ask()
        if not aas or not aas.strip():
            raise GooglePlayAccountError("AAS token cannot be empty")
        return aas.strip()

    cmd = [apkeep_bin, "-e", email, "--oauth-token", oauth_token]
    res = subprocess.run(cmd, capture_output=True, text=True, check=False)
    if res.returncode != 0:
        # Sanitize output so oauth_token doesn't leak
        sanitized = res.stderr.replace(oauth_token, "[REDACTED_OAUTH_TOKEN]")
        raise GooglePlayAccountError(
            f"Failed to exchange oauth token with apkeep: {sanitized.strip()}"
        )
    # Parse AAS token from output
    # apkeep typically outputs "AAS token: <token>" or prints it directly
    output = res.stdout + "\n" + res.stderr
    token = None
    for line in output.splitlines():
        if "aas_token" in line.lower() or "aas token" in line.lower():
            parts = line.split(":", 1)
            if len(parts) == 2:
                token = parts[1].strip()
                break
        elif line.strip().startswith("aas_et/"):
            token = line.strip()
            break

    if not token:
        # If apkeep created or printed credentials, try to find any non-empty aas token string
        for word in output.split():
            if word.startswith("aas_et/"):
                token = word.strip()
                break

    if not token:
        print("\nCould not automatically extract AAS token from apkeep output.")
        aas = questionary.password("Please enter the AAS token returned:").ask()
        if not aas or not aas.strip():
            raise GooglePlayAccountError("AAS token cannot be empty")
        return aas.strip()

    return token


def view_accounts(accounts_file: GooglePlayAccountsFile | None) -> None:
    if not accounts_file or not accounts_file.accounts:
        print("\nNo Google Play accounts configured.\n")
        return

    print("\nConfigured Google Play Accounts:")
    print("=" * 60)
    for idx, acc in enumerate(accounts_file.accounts, 1):
        status = "ENABLED" if acc.enabled else "DISABLED"
        print(f"{idx}. [{acc.label}] {acc.redacted_email} ({status})")
        print(
            f"   Device: {acc.device} | Locale: {acc.locale} | Timezone: {acc.timezone}"
        )
        print("   Token: [REDACTED]")
    print("=" * 60 + "\n")


def add_account(accounts_file: GooglePlayAccountsFile | None) -> GooglePlayAccountsFile:
    print("\n--- Add Google Play Account ---")
    label = questionary.text("Account Label (e.g. personal, work):").ask()
    if not label or not label.strip():
        print("Canceled: label required.")
        return accounts_file or GooglePlayAccountsFile(version=1, accounts=())

    email = questionary.text("Account Email:").ask()
    if not email or not email.strip():
        print("Canceled: email required.")
        return accounts_file or GooglePlayAccountsFile(version=1, accounts=())

    device = questionary.text("Device profile:", default="px_9a").ask() or "px_9a"
    locale = questionary.text("Locale:", default="en_US").ask() or "en_US"
    timezone = questionary.text("Timezone:", default="UTC").ask() or "UTC"

    print("\nGoogle OAuth Exchange Setup:")
    print("1. Go to Google Embedded Setup in browser to obtain an OAuth token:")
    print("   https://accounts.google.com/EmbeddedSetup")
    print("2. Retrieve the master oauth_token from the flow.")

    auth_method = questionary.select(
        "Token input method:",
        choices=[
            "Exchange one-use OAuth token via apkeep",
            "Enter pre-generated AAS token directly",
        ],
    ).ask()

    if auth_method == "Exchange one-use OAuth token via apkeep":
        oauth_token = questionary.password("Enter one-use OAuth token (masked):").ask()
        if not oauth_token or not oauth_token.strip():
            print("Canceled: OAuth token required.")
            return accounts_file or GooglePlayAccountsFile(version=1, accounts=())
        aas_token = exchange_oauth_for_aas(email.strip(), oauth_token.strip())
    else:
        aas_token = questionary.password("Enter AAS token (masked):").ask()
        if not aas_token or not aas_token.strip():
            print("Canceled: AAS token required.")
            return accounts_file or GooglePlayAccountsFile(version=1, accounts=())

    new_acc = GooglePlayAccount.from_dict(
        {
            "label": label.strip(),
            "email": email.strip().lower(),
            "aasToken": aas_token.strip(),
            "device": device.strip(),
            "locale": locale.strip(),
            "timezone": timezone.strip(),
            "enabled": True,
        }
    )

    current_list = list(accounts_file.accounts) if accounts_file else []
    # Check for duplicate email
    for existing in current_list:
        if existing.email == new_acc.email:
            raise GooglePlayAccountError(
                f"Account with email {new_acc.email} already exists"
            )

    current_list.append(new_acc)
    updated = GooglePlayAccountsFile(version=1, accounts=tuple(current_list))
    dest = save_google_play_accounts(updated)
    print(f"\nAccount [{new_acc.label}] saved to {dest} (mode 0600).\n")
    return updated


def delete_account(
    accounts_file: GooglePlayAccountsFile | None,
) -> GooglePlayAccountsFile:
    if not accounts_file or not accounts_file.accounts:
        print("\nNo accounts to delete.\n")
        return accounts_file or GooglePlayAccountsFile(version=1, accounts=())

    choices: list[questionary.Choice | str] = [
        questionary.Choice(
            title=f"{acc.label} ({acc.redacted_email})",
            value=acc.email,
        )
        for acc in accounts_file.accounts
    ]
    choices.append(questionary.Choice(title="Cancel", value=None))
    selected = questionary.select("Select account to delete:", choices=choices).ask()
    if not selected or selected == "Cancel":
        return accounts_file

    target_acc = next(
        (acc for acc in accounts_file.accounts if acc.email == selected),
        None,
    )
    if target_acc is None:
        target_acc = next(
            (
                acc
                for acc in accounts_file.accounts
                if f"{acc.label} ({acc.redacted_email})" == selected
                or acc.label == selected
            ),
            None,
        )
    if target_acc is None:
        return accounts_file

    confirm = questionary.confirm(
        f"Are you sure you want to permanently delete account [{target_acc.label}]?",
        default=False,
    ).ask()

    if not confirm:
        print("Deletion canceled.")
        return accounts_file

    remaining = [acc for acc in accounts_file.accounts if acc.email != target_acc.email]
    updated = GooglePlayAccountsFile(version=1, accounts=tuple(remaining))
    save_google_play_accounts(updated)
    print(f"Account [{target_acc.label}] deleted.\n")
    return updated


def check_accounts(accounts_file: GooglePlayAccountsFile | None) -> None:
    if not accounts_file or not accounts_file.accounts:
        print("\nNo accounts configured to check.\n")
        return

    print("\nChecking accounts via play-metadata helper...")
    # Find play-metadata helper binary if compiled or Cargo project
    helper_bin = (
        Path(__file__).parent.parent.parent
        / "tools"
        / "play-metadata"
        / "target"
        / "release"
        / "play-metadata"
    )
    if not helper_bin.is_file():
        helper_bin = (
            Path(__file__).parent.parent.parent
            / "play-metadata"
            / "target"
            / "release"
            / "play-metadata"
        )
    manifest_path = (
        Path(__file__).parent.parent.parent / "tools" / "play-metadata" / "Cargo.toml"
    )
    if not manifest_path.is_file():
        manifest_path = (
            Path(__file__).parent.parent.parent / "play-metadata" / "Cargo.toml"
        )

    cmd: list[str] | None = None
    if helper_bin.is_file() and os.access(helper_bin, os.X_OK):
        cmd = [str(helper_bin)]
    elif manifest_path.is_file():
        cmd = ["cargo", "run", "--quiet", "--manifest-path", str(manifest_path), "--"]
    else:
        print("play-metadata helper not found. Accounts file validated locally.")
        for acc in accounts_file.accounts:
            status = "Enabled" if acc.enabled else "Disabled"
            print(
                f"  Account [{acc.label}] {acc.redacted_email}: Valid local format ({status})"
            )
        return

    all_results = []
    all_failures = []
    for acc in accounts_file.accounts:
        if not acc.enabled:
            continue
        request = {
            "accounts": {"version": accounts_file.version, "accounts": [acc.to_dict()]},
            "packages": ["com.adobe.scan.android"],
        }
        input_str = json.dumps(request)
        res = subprocess.run(
            cmd, input=input_str, capture_output=True, text=True, check=False
        )
        if res.returncode != 0:
            code = res.returncode
            err_msg = res.stderr[:300] if res.stderr else "Command did not run"
            if acc.aas_token and acc.aas_token in err_msg:
                err_msg = err_msg.replace(acc.aas_token, "[REDACTED]")
            all_failures.append(
                {
                    "accountLabel": acc.label,
                    "packageName": "com.adobe.scan.android",
                    "reason": f"Helper exited with code {code}: {err_msg.strip()}",
                }
            )
            print(f"Check failed with exit code {code}")
            print(err_msg)
            continue

        try:
            data = json.loads(res.stdout)
            if isinstance(data, dict):
                results = data.get("results")
                failures = data.get("failures")
                if isinstance(results, list):
                    all_results.extend([r for r in results if isinstance(r, dict)])
                if isinstance(failures, list):
                    all_failures.extend([f for f in failures if isinstance(f, dict)])
            else:
                all_failures.append(
                    {
                        "accountLabel": acc.label,
                        "packageName": "com.adobe.scan.android",
                        "reason": f"Unexpected response format: expected dict, got {type(data).__name__}",
                    }
                )
        except (json.JSONDecodeError, KeyError, AttributeError) as e:
            print(f"Error parsing metadata response: {e}")
            all_failures.append(
                {
                    "accountLabel": acc.label,
                    "packageName": "com.adobe.scan.android",
                    "reason": f"Failed to parse response: {e}",
                }
            )

    print(
        f"Verified accounts: {len(all_results)} success, {len(all_failures)} failures."
    )
    for r in all_results:
        print(
            f"  Account [{r.get('accountLabel')}]: Authenticated successfully (tested {r.get('packageName')} v{r.get('versionName')})"
        )
    for f in all_failures:
        print(
            f"  Failed: [{f.get('accountLabel', 'unknown')}] {f.get('packageName', 'unknown')} ({f.get('reason')})"
        )


def sync_github_secret(accounts_file: GooglePlayAccountsFile | None) -> None:
    if not accounts_file or not accounts_file.accounts:
        print("\nNo accounts to sync.\n")
        return

    gh_bin = shutil.which("gh")
    if not gh_bin:
        print(
            "\nError: 'gh' CLI is not installed or not in PATH. Local file unchanged.\n"
        )
        return

    # Check gh auth status
    auth_check = subprocess.run(
        [gh_bin, "auth", "status"], capture_output=True, text=True, check=False
    )
    if auth_check.returncode != 0:
        print(
            f"\nError: 'gh' is not authenticated ({auth_check.stderr.strip()}). Local file unchanged.\n"
        )
        return

    minified_json = accounts_file.to_json()
    cmd = [
        gh_bin,
        "secret",
        "set",
        "APKEEP_ACCOUNTS",
        "--repo",
        "ihatenodejs/aidans-patches",
    ]
    print("\nSending minified APKEEP_ACCOUNTS to GitHub Actions via stdin...")
    res = subprocess.run(
        cmd, input=minified_json, text=True, capture_output=True, check=False
    )
    if res.returncode != 0:
        print(f"Failed to set secret: {res.stderr.strip()}\n")
    else:
        print(
            "Successfully synchronized APKEEP_ACCOUNTS secret to ihatenodejs/aidans-patches.\n"
        )


def run_play_accounts_tui() -> int:
    try:
        accounts_file = load_google_play_accounts(require_enabled=False)
    except (GooglePlayAccountError, OSError) as e:
        print(f"Warning: Could not load existing accounts: {e}")
        accounts_file = None

    menu_choices = [
        "View accounts",
        "Add account",
        "Delete account",
        "Check accounts",
        "Sync GitHub Actions secret",
        "Exit",
    ]

    while True:
        try:
            choice = questionary.select(
                "Google Play Accounts Management:",
                choices=menu_choices,
            ).ask()

            if choice is None or choice == "Exit":
                print("Exiting.")
                break
            elif choice == "View accounts":
                view_accounts(accounts_file)
            elif choice == "Add account":
                accounts_file = add_account(accounts_file)
            elif choice == "Delete account":
                accounts_file = delete_account(accounts_file)
            elif choice == "Check accounts":
                check_accounts(accounts_file)
            elif choice == "Sync GitHub Actions secret":
                sync_github_secret(accounts_file)
        except (KeyboardInterrupt, EOFError):
            print("\nExiting.")
            break
        except (GooglePlayAccountError, ValueError, OSError) as e:
            print(f"\nError: {e}\n")
    return ExitCode.SUCCESS
