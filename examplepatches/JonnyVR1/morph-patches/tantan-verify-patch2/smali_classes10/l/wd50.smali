.class public final synthetic Ll/wd50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ae50;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/ae50;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wd50;->a:Ll/ae50;

    iput-boolean p2, p0, Ll/wd50;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wd50;->a:Ll/ae50;

    iget-boolean p0, p0, Ll/wd50;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {v0, p0, p1}, Ll/ae50;->N3(Ll/ae50;ZLcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method
