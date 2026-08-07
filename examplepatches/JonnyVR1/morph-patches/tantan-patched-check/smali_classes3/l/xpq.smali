.class public final synthetic Ll/xpq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zpq;

.field public final synthetic b:Ll/ve20;

.field public final synthetic c:Ll/lf2;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:[Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ll/zpq;Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xpq;->a:Ll/zpq;

    iput-object p2, p0, Ll/xpq;->b:Ll/ve20;

    iput-object p3, p0, Ll/xpq;->c:Ll/lf2;

    iput-object p4, p0, Ll/xpq;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/xpq;->e:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xpq;->a:Ll/zpq;

    iget-object v1, p0, Ll/xpq;->b:Ll/ve20;

    iget-object v2, p0, Ll/xpq;->c:Ll/lf2;

    iget-object v3, p0, Ll/xpq;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/xpq;->e:[Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3, p0}, Ll/zpq;->a(Ll/zpq;Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
