.class public final synthetic Ll/aur;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eur;

.field public final synthetic b:Ll/rtr;


# direct methods
.method public synthetic constructor <init>(Ll/eur;Ll/rtr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aur;->a:Ll/eur;

    iput-object p2, p0, Ll/aur;->b:Ll/rtr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aur;->a:Ll/eur;

    iget-object p0, p0, Ll/aur;->b:Ll/rtr;

    check-cast p1, Ll/rtr;

    invoke-static {v0, p0, p1}, Ll/eur;->m0(Ll/eur;Ll/rtr;Ll/rtr;)V

    return-void
.end method
