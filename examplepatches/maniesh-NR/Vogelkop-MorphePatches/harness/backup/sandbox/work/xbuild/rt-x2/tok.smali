.class public interface abstract annotation Ltok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final a:Ly0b;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/16 v0, 0xa

    new-array v1, v0, [I

    fill-array-data v1, :array_1c

    sget-object v2, Ly0b;->c:Ly0b;

    const/16 v2, 0xb

    new-array v2, v2, [I

    const/4 v3, 0x0

    const/4 v4, 0x1

    aput v4, v2, v3

    invoke-static {v1, v3, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance v0, Ly0b;

    invoke-direct {v0, v2}, Ly0b;-><init>([I)V

    sput-object v0, Ltok;->a:Ly0b;

    return-void

    :array_1c
    .array-data 4
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
    .end array-data
.end method
