.class public final synthetic Ll/t590;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jic0;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public synthetic constructor <init>(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t590;->a:Ll/jic0;

    iput-object p2, p0, Ll/t590;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t590;->a:Ll/jic0;

    iget-object p0, p0, Ll/t590;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem;->c(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/android/app/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
