.class public final synthetic Ll/rd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yd9;


# direct methods
.method public synthetic constructor <init>(Ll/yd9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rd9;->a:Ll/yd9;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rd9;->a:Ll/yd9;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {p0, p1}, Ll/yd9;->i3(Ll/yd9;Lcom/p1/mobile/putong/core/data/CoreData;)Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method
