.class public final Llz4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnz4;

.field public final b:Lg7b;

.field public final c:Lkz4;

.field public final d:Lntn;


# direct methods
.method public constructor <init>(Lnz4;Lg7b;Lntn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz4;->a:Lnz4;

    iput-object p2, p0, Llz4;->b:Lg7b;

    new-instance p1, Lkz4;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llz4;->c:Lkz4;

    iput-object p3, p0, Llz4;->d:Lntn;

    return-void
.end method
