.class public final synthetic Ll/s0q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s0q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/s0q0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s0q0;->a:Ll/v3q0;

    iget-object p0, p0, Ll/s0q0;->b:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/v3q0;->T2(Ll/v3q0;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
