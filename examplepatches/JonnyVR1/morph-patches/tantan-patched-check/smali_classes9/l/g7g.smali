.class public final synthetic Ll/g7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/x7g;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/x7g;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g7g;->a:Ll/x7g;

    iput-object p2, p0, Ll/g7g;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g7g;->a:Ll/x7g;

    iget-object p0, p0, Ll/g7g;->b:Ljava/lang/String;

    check-cast p1, Ll/cm0;

    invoke-static {v0, p0, p1}, Ll/x7g;->a(Ll/x7g;Ljava/lang/String;Ll/cm0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
