.class public final synthetic Ll/ypm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aqm0;


# direct methods
.method public synthetic constructor <init>(Ll/aqm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ypm0;->a:Ll/aqm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ypm0;->a:Ll/aqm0;

    check-cast p1, Lcom/p1/mobile/putong/data/Meta;

    invoke-static {p0, p1}, Ll/aqm0;->P3(Ll/aqm0;Lcom/p1/mobile/putong/data/Meta;)V

    return-void
.end method
