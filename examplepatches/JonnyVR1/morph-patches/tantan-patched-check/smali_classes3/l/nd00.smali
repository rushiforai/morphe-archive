.class public final synthetic Ll/nd00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pd00;


# direct methods
.method public synthetic constructor <init>(Ll/pd00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nd00;->a:Ll/pd00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd00;->a:Ll/pd00;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {p0, p1}, Ll/pd00;->d(Ll/pd00;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
