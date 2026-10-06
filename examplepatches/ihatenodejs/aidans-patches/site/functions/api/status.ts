interface Env {
  WORKER_URL?: string;
}

export async function onRequestGet(context: { env: Env }): Promise<Response> {
  const workerUrl = context.env?.WORKER_URL;
  const endpoint = workerUrl
    ? new URL('/api/status', workerUrl).toString()
    : 'https://worker.patch.p0ntus.com/api/status';

  try {
    const upstreamResponse = await fetch(endpoint, {
      headers: {
        Accept: 'application/json',
      },
    });

    const body = await upstreamResponse.text();

    return new Response(body, {
      status: upstreamResponse.status,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, OPTIONS',
        'Cache-Control': 'public, max-age=300, s-maxage=3600',
      },
    });
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : String(err);
    return new Response(
      JSON.stringify({ error: 'Failed to proxy status request', details: message }),
      {
        status: 502,
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      }
    );
  }
}

export async function onRequestOptions(): Promise<Response> {
  return new Response(null, {
    status: 204,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    },
  });
}
