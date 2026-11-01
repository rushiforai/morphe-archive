# sf-bridge

Lets the patched chess.com on your phone run Game Review on **the Stockfish of your own computer**
instead of the phone's, over your own Wi-Fi. It is what the *Stockfish on your computer* reviewer in
[Quwi's Chess Patches](../README.md) talks to.

Nothing leaves your network: the bridge only waits for the phone, it opens no connections of its own
and sends nothing anywhere. There are no accounts, no telemetry, no dependencies to install.

## What you need

- **Node.js 18 or newer** — <https://nodejs.org> (LTS installer).
- **Stockfish 17 or newer** — <https://stockfishchess.org/download/> (pick your OS, take the plain
  build). Version 19 was used for the numbers below.
- Phone and computer on the **same Wi-Fi**, with the router not isolating clients from each other.

## Setting it up

1. Copy the files of this folder to a folder of your choice, e.g. `C:\sf-bridge`.
2. Put `stockfish.exe` next to `server.js` (on macOS or Linux: `SF_PATH=/path/to/stockfish node server.js`).
3. Allow the port through your firewall, once, in an **administrator** terminal:

   ```
   netsh advfirewall firewall add rule name="sf-bridge" dir=in action=allow protocol=TCP localport=7892 profile=private
   ```

   (On Linux, `sudo ufw allow 7892/tcp`.)

4. Start it:

   ```
   node server.js
   ```

   ```
   sf-bridge: UCI over TCP on port 7892
     on your network: 192.168.1.10:7892  (the address the phone wants)
     cores:           12
     token:           3f9c1a2b…8d41e6   (whole one in token.txt)
   Waiting for the phone. Ctrl+C to stop.
   ```

   The first run writes `token.txt` next to the script. That file is your password: the phone needs
   the whole string, and the bridge refuses anyone who does not have it.

5. In the app: **More → Noam's Patches → Game Review → Stockfish on your computer**, then

   - **Computer address** — what the bridge printed after "on your network", e.g. `192.168.1.10:7892`;
   - **Token** — the whole string from `token.txt` (or copy `token.txt` into a message to yourself);
   - press **Test the connection**: *"The computer answered: its Stockfish is ready."*

   Leave the computer on and the bridge running during a review. The phone can now pick
   **Stockfish on your computer** in the review chooser, next to chess.com, Local Stockfish and Lichess.

## Benchmarks

The app has a **Benchmark your computer** button (in the same section) that times 100k, 300k, 1M and
5M nodes a move over one connection, with Stockfish's start-up measured apart. From this folder the
same thing runs on the command line, which is handy before you set the phone up:

```
node bench-tcp.mjs
```

```
Startup (once per review): 0.55 s
threads 12, hash 384 MB

100k nodes a move: 0.08 s
300k nodes a move: 0.12 s
1M   nodes a move: 0.28 s
5M   nodes a move: 1.18 s
```

(i5-12450H, 12 threads, 384 MB of hash.) Start-up is paid once per review, not once per move, so a
whole game at 1M nodes a move is about half a minute; at 5M, about two minutes.

`node test-tcp.mjs` goes through the protocol once and prints the engine's evaluations — useful if
the phone and the computer disagree about the token. Both scripts read `token.txt` from this folder
and talk to `127.0.0.1`; set `TEST_HOST` to test another machine on the network.

## The protocol

The port the app uses is **7892**. It is UCI with one handshake in front, one command per line:

```
server: sf-bridge 1 cores 12
client: auth <token>
server: auth ok            (or: auth fail, and the connection is closed)
... plain UCI, both ways
```

The greeting carries the core count so that *Auto* threads on the phone means this machine's cores.
Each connection starts its own Stockfish of this machine (a few tenths of a second) and keeps it for
the whole review, so every move of the game is searched by the same warm engine; it is told to quit
when the phone hangs up.

That is the only port the bridge opens. An earlier version also served a `/health` page on 7891 from
a WebSocket experiment; the app never used it, so it is gone — one listener, one firewall rule.

## If the phone does not see the computer

The bridge prints a line whenever a connection arrives, so the console tells you which half is
broken:

1. Both on the same Wi-Fi; turn mobile data off on the phone for the test.
2. Press **Test the connection** in the app. If it says it could not connect and *nothing* appeared
   in the bridge's console, the phone never reached the computer: it is the firewall rule in step 3
   or the router isolating its clients — not the app.
3. "The bridge refused the token" means `token.txt` and the token on the phone differ (one character
   wrong is enough). Copy it again, or delete `token.txt`, restart the bridge and re-enter the new
   one.
4. Timeouts in the middle of a review usually mean the computer went to sleep. Turn sleep off, or
   keep the bridge window visible.
5. The computer's address changes when it reconnects to Wi-Fi unless the router reserves one for it
   (DHCP reservation); that is worth doing once.

## What is not here

`token.txt`, `node_modules/` and `stockfish.exe` are ignored by git, and nothing in this folder knows
who you are: the address in the example above is a made-up `192.168.1.10`.
