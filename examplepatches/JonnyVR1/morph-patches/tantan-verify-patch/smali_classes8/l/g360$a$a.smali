.class public Ll/g360$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g360$a;->onCompleted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g360$a;


# direct methods
.method public constructor <init>(Ll/g360$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g360$a$a;->a:Ll/g360$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g360$a$a;->a:Ll/g360$a;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/g360$a;->e:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/g360$a;->e:Z

    .line 9
    .line 10
    iget-object p0, p0, Ll/g360$a;->g:Ll/gcg0;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
