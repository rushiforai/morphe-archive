.class public Ll/ufw$d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ufw$d;->A(Ll/ufw$e;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ufw$b;

.field public final synthetic b:I

.field public final synthetic c:Ll/ufw$d;


# direct methods
.method public constructor <init>(Ll/ufw$d;Ll/ufw$b;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ufw$d$a;->c:Ll/ufw$d;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ufw$d$a;->a:Ll/ufw$b;

    .line 4
    .line 5
    iput p3, p0, Ll/ufw$d$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ufw$d$a;->a:Ll/ufw$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ufw$b;->y()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/ufw$d$a;->c:Ll/ufw$d;

    .line 8
    .line 9
    iget p0, p0, Ll/ufw$d$a;->b:I

    .line 10
    .line 11
    invoke-virtual {v1, p0, v0}, Ll/ufw$d;->D(ILjava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
