.class public final synthetic Ll/t5i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5i;->a:Ll/y20;

    iput-object p2, p0, Ll/t5i;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t5i;->a:Ll/y20;

    iget-object p0, p0, Ll/t5i;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->Q4(Ll/y20;Ljava/util/List;)V

    return-void
.end method
