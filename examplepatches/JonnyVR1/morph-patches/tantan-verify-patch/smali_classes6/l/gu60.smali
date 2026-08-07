.class public final synthetic Ll/gu60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hu60;


# direct methods
.method public synthetic constructor <init>(Ll/hu60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gu60;->a:Ll/hu60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gu60;->a:Ll/hu60;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Ll/hu60;->C(Ll/hu60;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
