.class public final Ll/j43;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/zhd;

.field public final b:Z


# direct methods
.method public constructor <init>(Ll/zhd;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/j43;->b:Z

    .line 5
    .line 6
    iput-object p1, p0, Ll/j43;->a:Ll/zhd;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0, p1}, Ll/j43;-><init>(Ll/zhd;Z)V

    return-void
.end method


# virtual methods
.method public a()Ll/zhd;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j43;->a:Ll/zhd;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/j43;->b:Z

    .line 2
    .line 3
    return p0
.end method
