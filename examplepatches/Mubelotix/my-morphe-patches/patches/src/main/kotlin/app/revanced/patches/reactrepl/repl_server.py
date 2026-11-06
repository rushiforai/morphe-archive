import asyncio
import websockets
import json
import sys

LIGHT_GREY = "\033[90m"
RESET = "\033[0m"

async def handle_incoming_messages(websocket, result_queue):
    try:
        async for message in websocket:
            try:
                data = json.loads(message)
                msg_type = data.get('type')
                payload = data.get('payload')
                
                if msg_type == 'log':
                    print(f"\r{LIGHT_GREY}{payload}{RESET}")
                    # Re-print prompt indicator (visual only, doesn't affect input buffer)
                    sys.stdout.write("js> ")
                    sys.stdout.flush()
                elif msg_type == 'result':
                    await result_queue.put(payload)
                elif msg_type == 'status':
                    print(f"< {payload}")
                else:
                    print(f"< {payload}")
            except json.JSONDecodeError:
                print(f"< {message}")
    except websockets.exceptions.ConnectionClosed:
        await result_queue.put(None)
    except Exception as e:
        print(f"Error in receiver: {e}")
        await result_queue.put(None)

async def repl_handler(websocket):
    print(f"Client connected from {websocket.remote_address}")
    print("Type JavaScript code to execute on the client. Type 'exit' to quit.")
    
    result_queue = asyncio.Queue()
    receiver_task = asyncio.create_task(handle_incoming_messages(websocket, result_queue))
    
    command_buffer = ""

    try:
        while True:
            # Check if connection died
            if receiver_task.done():
                break

            prompt = "..> " if command_buffer else "js> "
            
            line = await asyncio.get_event_loop().run_in_executor(None, input, prompt)
            
            if line.strip().lower() in ['exit', 'quit']:
                break
            
            command_buffer += line + "\n"
            
            if (command_buffer.count('{') > command_buffer.count('}') or
                command_buffer.count('(') > command_buffer.count(')') or
                command_buffer.count('[') > command_buffer.count(']')):
                continue

            if not command_buffer.strip():
                command_buffer = ""
                continue

            await websocket.send(command_buffer)
            command_buffer = ""
            
            # Wait for specific result
            result = await result_queue.get()
            if result is None:
                print("Client disconnected")
                break
            print(f"< {result}")
            
    except websockets.exceptions.ConnectionClosed:
        print("Client disconnected")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        receiver_task.cancel()

async def main():
    print("REPL Server starting on 0.0.0.0:1337...")
    async with websockets.serve(repl_handler, "0.0.0.0", 1337):
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\nServer stopped.")
