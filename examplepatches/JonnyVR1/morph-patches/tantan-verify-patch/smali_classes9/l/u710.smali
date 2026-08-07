.class public final synthetic Ll/u710;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v710;

.field public final synthetic b:Ll/mq2;


# direct methods
.method public synthetic constructor <init>(Ll/v710;Ll/mq2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u710;->a:Ll/v710;

    iput-object p2, p0, Ll/u710;->b:Ll/mq2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u710;->a:Ll/v710;

    iget-object p0, p0, Ll/u710;->b:Ll/mq2;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/v710;->a(Ll/v710;Ll/mq2;Ljava/lang/String;)V

    return-void
.end method
