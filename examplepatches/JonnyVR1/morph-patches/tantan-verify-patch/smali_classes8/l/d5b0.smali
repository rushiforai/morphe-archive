.class public final synthetic Ll/d5b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/e5b0;


# direct methods
.method public synthetic constructor <init>(Ll/e5b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d5b0;->a:Ll/e5b0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d5b0;->a:Ll/e5b0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/e5b0;->c(Ll/e5b0;Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
