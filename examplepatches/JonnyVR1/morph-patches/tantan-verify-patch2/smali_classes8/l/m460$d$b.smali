.class public Ll/m460$d$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m460$d;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/m460$d;


# direct methods
.method public constructor <init>(Ll/m460$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m460$d$b;->a:Ll/m460$d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/m460$d$b;->a:Ll/m460$d;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/m460$d;->h(J)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-ltz v0, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "n >= 0 expected but it was "

    .line 17
    .line 18
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
