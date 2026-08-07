.class public final synthetic Ll/a0q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a0q0;->a:Ll/v3q0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0q0;->a:Ll/v3q0;

    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {p0, p1}, Ll/v3q0;->j2(Ll/v3q0;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method
