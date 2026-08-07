.class public final synthetic Ll/qi10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vi10;


# direct methods
.method public synthetic constructor <init>(Ll/vi10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qi10;->a:Ll/vi10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qi10;->a:Ll/vi10;

    check-cast p1, Ll/t910;

    invoke-static {p0, p1}, Ll/vi10;->T3(Ll/vi10;Ll/t910;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
