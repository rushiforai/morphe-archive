package app.morphe.extension.shared.function;

@FunctionalInterface
public interface ThrowingConsumer<T, E extends Exception> {
  void accept(T t) throws E;
}
