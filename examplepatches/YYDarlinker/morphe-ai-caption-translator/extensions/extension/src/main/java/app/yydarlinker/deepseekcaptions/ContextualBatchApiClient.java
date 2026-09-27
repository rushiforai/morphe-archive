package app.yydarlinker.deepseekcaptions;

/** Settings ABI: test the exact production event protocol. */
final class ContextualBatchApiClient {
  static void resetRejection() {
    RebuildApi.reset();
  }

  static String test(DeepSeekConfig.Snapshot c) throws Exception {
    return RebuildApi.test(c);
  }
}
