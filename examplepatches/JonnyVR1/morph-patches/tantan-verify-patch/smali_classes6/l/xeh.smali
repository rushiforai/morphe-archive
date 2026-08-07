.class public final synthetic Ll/xeh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zeh;


# direct methods
.method public synthetic constructor <init>(Ll/zeh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xeh;->a:Ll/zeh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xeh;->a:Ll/zeh;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/zeh;->c(Ll/zeh;Ljava/util/List;)V

    return-void
.end method
