// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using Dunet;

namespace BaconReader.E2ETools.Core;

/// <summary>Presence or absence of a value — never null-as-absence.</summary>
[Union]
public partial record Optional<T>
{
    partial record Some(T Value);
    partial record None();
}

/// <summary>Case constructors: <c>Optional.Some(x)</c> / <c>Optional.None&lt;T&gt;()</c>.</summary>
public static class Optional
{
    public static Optional<T> Some<T>(T value) => new Optional<T>.Some(value);

    public static Optional<T> None<T>() => new Optional<T>.None();

    public static Optional<T> FromNullable<T>(T? value)
        where T : class =>
        value is null ? None<T>() : Some(value);
}

public static class OptionalExtensions
{
    public static Optional<TOut> Map<T, TOut>(this Optional<T> optional, Func<T, TOut> map) =>
        optional.Match(
            some => Optional.Some(map(some.Value)),
            _ => Optional.None<TOut>());

    public static Optional<TOut> Bind<T, TOut>(this Optional<T> optional, Func<T, Optional<TOut>> bind) =>
        optional.Match(
            some => bind(some.Value),
            _ => Optional.None<TOut>());

    public static T UnwrapOr<T>(this Optional<T> optional, T fallback) =>
        optional.Match(
            some => some.Value,
            _ => fallback);

    public static Result<T, TFailure> ToResult<T, TFailure>(this Optional<T> optional, Func<TFailure> failure) =>
        optional.Match<Result<T, TFailure>>(
            some => new Result<T, TFailure>.Ok(some.Value),
            _ => new Result<T, TFailure>.Error(failure()));
}

/// <summary>Success or failure track of a railway. Construct with <c>new Result&lt;T, F&gt;.Ok(x)</c>.</summary>
[Union]
public partial record Result<T, TFailure>
{
    partial record Ok(T Value);
    partial record Error(TFailure Failure);
}

public static class ResultExtensions
{
    public static Result<TOut, TFailure> Map<T, TOut, TFailure>(this Result<T, TFailure> result, Func<T, TOut> map) =>
        result.Match<Result<TOut, TFailure>>(
            ok => new Result<TOut, TFailure>.Ok(map(ok.Value)),
            error => new Result<TOut, TFailure>.Error(error.Failure));

    public static Result<TOut, TFailure> Bind<T, TOut, TFailure>(
        this Result<T, TFailure> result,
        Func<T, Result<TOut, TFailure>> bind) =>
        result.Match(
            ok => bind(ok.Value),
            error => new Result<TOut, TFailure>.Error(error.Failure));

    public static Result<T, TOut> MapError<T, TFailure, TOut>(this Result<T, TFailure> result, Func<TFailure, TOut> map) =>
        result.Match<Result<T, TOut>>(
            ok => new Result<T, TOut>.Ok(ok.Value),
            error => new Result<T, TOut>.Error(map(error.Failure)));

    /// <summary>Every value, or every failure (so a reader can report all problems at once).</summary>
    public static Result<ImmutableArray<T>, ImmutableArray<TFailure>> CombineAll<T, TFailure>(
        this IEnumerable<Result<T, TFailure>> results)
    {
        var values = ImmutableArray.CreateBuilder<T>();
        var failures = ImmutableArray.CreateBuilder<TFailure>();
        foreach (var result in results)
        {
            result.Match(
                ok => { values.Add(ok.Value); return new Unit.Value(); },
                error => { failures.Add(error.Failure); return new Unit.Value(); });
        }

        return failures.Count == 0
            ? new Result<ImmutableArray<T>, ImmutableArray<TFailure>>.Ok(values.ToImmutable())
            : new Result<ImmutableArray<T>, ImmutableArray<TFailure>>.Error(failures.ToImmutable());
    }
}

/// <summary>The single "nothing interesting" value: <c>new Unit.Value()</c>.</summary>
[Union]
public partial record Unit
{
    partial record Value();
}
