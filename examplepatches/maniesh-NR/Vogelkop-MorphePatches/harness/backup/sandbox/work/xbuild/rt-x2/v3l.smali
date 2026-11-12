.class public final Lv3l;
.super Lrc;
.source "SourceFile"


# instance fields
.field public final d:I


# direct methods
.method public constructor <init>(Lpc;Ljf;I)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lrc;-><init>(Lpc;Ljf;Z)V

    iput p3, p0, Lv3l;->d:I

    return-void
.end method
