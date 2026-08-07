.class public final synthetic Ll/nfj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nfj0;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nfj0;->a:Ljava/util/List;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$b;->a(Ljava/util/List;Lrx/Notification;)V

    return-void
.end method
