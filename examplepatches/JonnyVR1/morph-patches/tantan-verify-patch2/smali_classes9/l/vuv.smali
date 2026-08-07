.class public final synthetic Ll/vuv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mvv;


# direct methods
.method public synthetic constructor <init>(Ll/mvv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vuv;->a:Ll/mvv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vuv;->a:Ll/mvv;

    check-cast p1, Ll/myk;

    invoke-static {p0, p1}, Ll/mvv;->C4(Ll/mvv;Ll/myk;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
