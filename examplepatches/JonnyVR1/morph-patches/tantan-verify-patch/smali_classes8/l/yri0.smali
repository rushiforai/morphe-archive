.class public final synthetic Ll/yri0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zri0;


# direct methods
.method public synthetic constructor <init>(Ll/zri0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yri0;->a:Ll/zri0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yri0;->a:Ll/zri0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/zri0;->c(Ll/zri0;Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
