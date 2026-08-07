.class public final synthetic Ll/h6q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bkj0;


# direct methods
.method public synthetic constructor <init>(Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h6q;->a:Ll/bkj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h6q;->a:Ll/bkj0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->w(Ll/bkj0;Ljava/util/List;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
