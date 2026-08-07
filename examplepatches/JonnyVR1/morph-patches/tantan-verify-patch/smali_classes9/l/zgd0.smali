.class public final synthetic Ll/zgd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/uhd0;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/uhd0;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zgd0;->a:Ll/uhd0;

    iput-object p2, p0, Ll/zgd0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zgd0;->a:Ll/uhd0;

    iget-object p0, p0, Ll/zgd0;->b:Ll/y20;

    invoke-static {v0, p0, p1}, Ll/uhd0;->M3(Ll/uhd0;Ll/y20;Ljava/lang/Object;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
