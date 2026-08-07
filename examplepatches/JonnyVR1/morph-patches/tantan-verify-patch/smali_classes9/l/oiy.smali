.class public final synthetic Ll/oiy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/riy;


# direct methods
.method public synthetic constructor <init>(Ll/riy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oiy;->a:Ll/riy;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oiy;->a:Ll/riy;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/riy;->Y3(Ll/riy;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
