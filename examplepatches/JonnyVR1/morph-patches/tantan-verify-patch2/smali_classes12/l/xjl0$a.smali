.class public Ll/xjl0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xjl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field final synthetic d:Ll/xjl0;


# direct methods
.method public constructor <init>(Ll/xjl0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xjl0$a;->d:Ll/xjl0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/xjl0$a;->b:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/xjl0$a;->c:Z

    .line 10
    .line 11
    iput p2, p0, Ll/xjl0$a;->a:I

    .line 12
    .line 13
    return-void
.end method
