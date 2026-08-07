.class public Ll/xl70$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xl70;->n(Ll/xc00;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ll/xl70$d;


# direct methods
.method public constructor <init>(Ll/xc00;Ll/xl70$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xl70$b;->a:Ll/xc00;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xl70$b;->b:Ll/xl70$d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 2

    .line 1
    new-instance p1, Ll/xl70$e;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Ll/xl70$c;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {p1, v0, v1}, Ll/xl70$e;-><init>([Ll/xl70$c;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/xl70$b;->a:Ll/xc00;

    .line 11
    .line 12
    iget-object p0, p0, Ll/xl70$b;->b:Ll/xl70$d;

    .line 13
    .line 14
    invoke-static {v0, p0, p1}, Ll/xl70;->f(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xl70$b;->a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
