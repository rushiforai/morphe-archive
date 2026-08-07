.class public Ll/ori0$e;
.super Ll/ori0$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ori0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final b:Z


# direct methods
.method public constructor <init>(Ll/ori0$c;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ori0$d;-><init>(Ll/ori0$c;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/ori0$e;->b:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ori0$e;->b:Z

    .line 2
    .line 3
    return p0
.end method
