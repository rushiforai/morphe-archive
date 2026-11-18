# Native quality-command regression fixtures

Captured from the actual mounted Advanced row in YouTube 21.43.523 on the Android
16 test emulator. The first command precedes the controller's asynchronous
quality update; the second follows it. Both are encoded by the native
MessageLite serializer before executing any command. They contain template,
controller and format data; no account credentials or user content.

The empty command is 3491 bytes. The populated command is 3603 bytes and has five
resolution entries (720, 480, 360, 240 and 144) in the Advanced sheet model. These
captures reproduce the empty-menu regression caused by clicking at the first
draw. Tests require real available-format entries, independent of display labels.

Source evidence: quality-items-63.log and quality-command-{0,1}-63.bin in the
port-completion-20261113 local evidence directory. Diagnostic logging and
reflection are excluded from the production implementation.
