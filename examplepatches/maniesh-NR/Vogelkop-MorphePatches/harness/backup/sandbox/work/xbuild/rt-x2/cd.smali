.class public final Lcd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpc;

.field public b:Ljf;


# direct methods
.method public constructor <init>(Lpc;Ljf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcd;->a:Lpc;

    iput-object p2, p0, Lcd;->b:Ljf;

    return-void
.end method
