.class public Ll/xl2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xl2;->w4(Ll/uoe0;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uoe0;

.field public final synthetic b:Ll/xl2;


# direct methods
.method public constructor <init>(Ll/xl2;Ll/uoe0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xl2$a;->b:Ll/xl2;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xl2$a;->a:Ll/uoe0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xl2$a;->a:Ll/uoe0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xl2$a;->b:Ll/xl2;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v1, v2}, Ll/gpc0;->d(Ll/uoe0;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/xl2$a;->a:Ll/uoe0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/uoe0;->s:Ll/y20;

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
