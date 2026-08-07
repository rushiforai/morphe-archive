.class public final synthetic Ll/x1j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a2j;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/a2j;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x1j;->a:Ll/a2j;

    iput-object p2, p0, Ll/x1j;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x1j;->a:Ll/a2j;

    iget-object p0, p0, Ll/x1j;->b:Ll/x20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/a2j;->e0(Ll/a2j;Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method
