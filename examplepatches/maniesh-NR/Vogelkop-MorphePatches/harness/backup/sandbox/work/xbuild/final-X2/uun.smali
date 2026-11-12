.class public final Luun;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhh4;


# instance fields
.field public final a:Lzun;

.field public b:Z


# direct methods
.method public constructor <init>(Lzun;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luun;->a:Lzun;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Luun;->b:Z

    return-void
.end method
