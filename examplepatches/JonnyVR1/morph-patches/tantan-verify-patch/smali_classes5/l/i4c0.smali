.class public final synthetic Ll/i4c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s4c0;

.field public final synthetic b:Ll/i1c0;


# direct methods
.method public synthetic constructor <init>(Ll/s4c0;Ll/i1c0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i4c0;->a:Ll/s4c0;

    iput-object p2, p0, Ll/i4c0;->b:Ll/i1c0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i4c0;->a:Ll/s4c0;

    iget-object p0, p0, Ll/i4c0;->b:Ll/i1c0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/s4c0;->b(Ll/s4c0;Ll/i1c0;Ljava/lang/Boolean;)V

    return-void
.end method
