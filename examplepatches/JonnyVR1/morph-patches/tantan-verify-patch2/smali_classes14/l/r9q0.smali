.class public final synthetic Ll/r9q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ccq0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ccq0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r9q0;->a:Ll/ccq0;

    iput-object p2, p0, Ll/r9q0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r9q0;->a:Ll/ccq0;

    iget-object p0, p0, Ll/r9q0;->b:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/ccq0;->M2(Ll/ccq0;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
