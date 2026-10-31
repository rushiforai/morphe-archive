import pathlib,subprocess,sys,time
source=pathlib.Path('scripts/media-gallery/run.py').read_text(encoding='utf-8-sig');exec(source.split('\ntry:\n rpc.setup',1)[0])
try:
 rpc.setup('http://10.0.2.2:'+str(server.server_port));print(rpc.inline_limits(),flush=True);print(rpc.inline_setup(),flush=True);time.sleep(3);s=rpc.inline_state();print('INLINE_GIF',s,flush=True);assert s['installed'] and s['playing'],s
 rpc.inline_hide();time.sleep(.5);assert not rpc.inline_state()['playing'];print('PASS hidden normal GIF pauses',flush=True)
 rpc.inline_x();time.sleep(10);s=rpc.inline_state();print('INLINE_X',s,flush=True);assert s['installed'] and s['playing'] and not s['closed'],s
 print('BOUNDS',rpc.inline_bounds(),flush=True)
 rpc.inline_network(False);time.sleep(.7);assert not rpc.inline_state()['playing'];print('PASS non-WiFi stops playback',flush=True)
 rpc.inline_network(True);time.sleep(4);assert rpc.inline_state()['playing'];print('PASS WiFi restores playback',flush=True)
 rpc.inline_hide();time.sleep(.5);assert not rpc.inline_state()['playing'];print('PASS hidden X GIF pauses',flush=True)
 rpc.preference('inlineGifAutoplay',False);time.sleep(.5);assert rpc.inline_state()['closed'];print('PASS inline OFF releases playback',flush=True)
finally:
 try:rpc.inline_cleanup();rpc.cleanup()
 finally:session.detach();server.shutdown()
