from __future__ import annotations

import subprocess
from unittest.mock import patch

import pytest
from apk_lab.google_play_accounts import (
    GooglePlayAccount,
    GooglePlayAccountError,
    GooglePlayAccountsFile,
    load_google_play_accounts,
    save_google_play_accounts,
)
from apk_lab.play_accounts_tui import (
    add_account,
    check_accounts,
    delete_account,
    exchange_oauth_for_aas,
    sync_github_secret,
    view_accounts,
)


def test_view_accounts_redaction(capsys):
    acc = GooglePlayAccount(
        label="my-label",
        email="personal@example.com",
        aas_token="secret_token_12345",
    )
    accs = GooglePlayAccountsFile(version=1, accounts=(acc,))
    view_accounts(accs)

    captured = capsys.readouterr().out
    assert "my-label" in captured
    assert "pe***@example.com" in captured
    assert "personal@example.com" not in captured
    assert "secret_token_12345" not in captured
    assert "[REDACTED]" in captured


def test_delete_account_confirmation(monkeypatch, tmp_path):
    target = tmp_path / "accounts.json"
    monkeypatch.setenv("APKEEP_ACCOUNTS_FILE", str(target))
    acc1 = GooglePlayAccount(label="acc1", email="acc1@test.com", aas_token="t1")
    acc2 = GooglePlayAccount(label="acc2", email="acc2@test.com", aas_token="t2")
    accs = GooglePlayAccountsFile(version=1, accounts=(acc1, acc2))
    save_google_play_accounts(accs, target_path=target)
    # 1. Cancel deletion
    with (
        patch("questionary.select") as mock_sel,
        patch("questionary.confirm") as mock_conf,
    ):
        mock_sel.return_value.ask.return_value = "acc1 (ac***@test.com)"
        mock_conf.return_value.ask.return_value = False
        remaining = delete_account(accs)
        assert len(remaining.accounts) == 2

    # 2. Confirm deletion
    with (
        patch("questionary.select") as mock_sel,
        patch("questionary.confirm") as mock_conf,
    ):
        mock_sel.return_value.ask.return_value = "acc1@test.com"
        mock_conf.return_value.ask.return_value = True
        remaining = delete_account(accs)
        assert len(remaining.accounts) == 1
        assert remaining.accounts[0].label == "acc2"

    saved_after = load_google_play_accounts(target, require_enabled=False)
    assert saved_after is not None
    assert len(saved_after.accounts) == 1
    assert saved_after.accounts[0].label == "acc2"


def test_delete_account_identical_labels(monkeypatch, tmp_path):
    target = tmp_path / "accounts.json"
    monkeypatch.setenv("APKEEP_ACCOUNTS_FILE", str(target))
    acc1 = GooglePlayAccount(label="work", email="acc1@test.com", aas_token="t1")
    acc2 = GooglePlayAccount(label="work", email="acc2@test.com", aas_token="t2")
    accs = GooglePlayAccountsFile(version=1, accounts=(acc1, acc2))
    save_google_play_accounts(accs, target_path=target)

    with (
        patch("questionary.select") as mock_sel,
        patch("questionary.confirm") as mock_conf,
    ):
        mock_sel.return_value.ask.return_value = "acc1@test.com"
        mock_conf.return_value.ask.return_value = True
        remaining = delete_account(accs)
        assert len(remaining.accounts) == 1
        assert remaining.accounts[0].email == "acc2@test.com"
        assert remaining.accounts[0].label == "work"

    saved = load_google_play_accounts(target, require_enabled=False)
    assert saved is not None
    assert len(saved.accounts) == 1
    assert saved.accounts[0].email == "acc2@test.com"


def test_add_account_validates_fields(monkeypatch, tmp_path):
    target = tmp_path / "accounts.json"
    monkeypatch.setenv("APKEEP_ACCOUNTS_FILE", str(target))
    with (
        patch("questionary.text") as mock_text,
        patch("questionary.select") as mock_sel,
        patch("questionary.password") as mock_pass,
    ):
        mock_text.return_value.ask.side_effect = [
            "valid-label",
            "not-an-email",
            "px_9a",
            "en_US",
            "UTC",
        ]
        mock_sel.return_value.ask.return_value = (
            "Enter pre-generated AAS token directly"
        )
        mock_pass.return_value.ask.return_value = "some_token"

        with pytest.raises(GooglePlayAccountError, match="malformed"):
            add_account(None)


def test_sync_github_secret_stdin(monkeypatch, capsys):
    acc = GooglePlayAccount(label="acc1", email="acc1@test.com", aas_token="token_abc")
    accs = GooglePlayAccountsFile(version=1, accounts=(acc,))

    captured_stdin = []
    captured_args = []

    def mock_run(cmd, input=None, **kwargs):
        captured_args.append(cmd)
        if input:
            captured_stdin.append(input)
        return subprocess.CompletedProcess(cmd, returncode=0, stdout="", stderr="")

    monkeypatch.setattr("shutil.which", lambda name: "/usr/bin/gh")
    monkeypatch.setattr("subprocess.run", mock_run)

    sync_github_secret(accs)

    # Verify gh command
    set_cmds = [c for c in captured_args if "secret" in c]
    assert len(set_cmds) == 1
    assert set_cmds[0] == [
        "/usr/bin/gh",
        "secret",
        "set",
        "APKEEP_ACCOUNTS",
        "--repo",
        "ihatenodejs/aidans-patches",
    ]
    # Secret MUST NOT appear in argv
    for arg in set_cmds[0]:
        assert "token_abc" not in arg
        assert "acc1@test.com" not in arg
    # Secret MUST appear in stdin payload
    assert len(captured_stdin) == 1
    assert "token_abc" in captured_stdin[0]


def test_exchange_oauth_for_aas_apkeep(monkeypatch):
    def mock_run(cmd, **kwargs):
        return subprocess.CompletedProcess(
            cmd, returncode=0, stdout="aas_token: aas_et/test_token_123", stderr=""
        )

    monkeypatch.setattr(
        "apk_lab.play_accounts_tui.resolve_apkeep_binary", lambda: "/fake/apkeep"
    )
    monkeypatch.setattr("subprocess.run", mock_run)

    token = exchange_oauth_for_aas("u@example.com", "oauth_val")
    assert token == "aas_et/test_token_123"


def test_check_accounts_failures_and_redaction(monkeypatch, capsys):
    acc1 = GooglePlayAccount(
        label="acc1", email="acc1@test.com", aas_token="token_secret_123"
    )
    acc2 = GooglePlayAccount(
        label="acc2", email="acc2@test.com", aas_token="token_secret_456"
    )
    acc_file = GooglePlayAccountsFile(version=1, accounts=[acc1, acc2])

    call_count = 0

    def mock_run(cmd, input=None, capture_output=True, text=True, check=False):
        nonlocal call_count
        call_count += 1
        if call_count == 1:
            return subprocess.CompletedProcess(
                args=cmd,
                returncode=1,
                stdout="",
                stderr="Error: auth failed for token_secret_123",
            )
        else:
            return subprocess.CompletedProcess(
                args=cmd,
                returncode=0,
                stdout="malformed json {{{",
                stderr="",
            )

    monkeypatch.setattr("subprocess.run", mock_run)
    check_accounts(acc_file)

    captured = capsys.readouterr().out
    assert "token_secret_123" not in captured
    assert "[REDACTED]" in captured
    assert "0 success, 2 failures" in captured
    assert (
        "Failed: [acc1] com.adobe.scan.android (Helper exited with code 1: Error: auth failed for [REDACTED])"
        in captured
    )
    assert (
        "Failed: [acc2] com.adobe.scan.android (Failed to parse response:" in captured
    )


def test_check_accounts_unexpected_json_format(monkeypatch, capsys):
    acc = GooglePlayAccount(
        label="acc1", email="acc1@test.com", aas_token="token_secret_123"
    )
    acc_file = GooglePlayAccountsFile(version=1, accounts=[acc])

    def mock_run(cmd, input=None, capture_output=True, text=True, check=False):
        return subprocess.CompletedProcess(
            args=cmd,
            returncode=0,
            stdout="[1, 2, 3]",
            stderr="",
        )

    monkeypatch.setattr("subprocess.run", mock_run)
    check_accounts(acc_file)

    captured = capsys.readouterr().out
    assert "0 success, 1 failures" in captured
    assert (
        "Failed: [acc1] com.adobe.scan.android (Unexpected response format: expected dict, got list)"
        in captured
    )
