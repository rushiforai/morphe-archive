.class public final synthetic Ll/fa80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/y20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fa80;->a:Ll/y20;

    iput-boolean p2, p0, Ll/fa80;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fa80;->a:Ll/y20;

    iget-boolean p0, p0, Ll/fa80;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    invoke-static {v0, p0, p1}, Ll/ha80;->L3(Ll/y20;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method
