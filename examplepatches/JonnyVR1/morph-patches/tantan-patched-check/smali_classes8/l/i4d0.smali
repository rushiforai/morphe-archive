.class public final synthetic Ll/i4d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/s4d0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/v5;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/s4d0;Ljava/lang/String;Ll/v5;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i4d0;->a:Ll/s4d0;

    iput-object p2, p0, Ll/i4d0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/i4d0;->c:Ll/v5;

    iput-object p4, p0, Ll/i4d0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i4d0;->a:Ll/s4d0;

    iget-object v1, p0, Ll/i4d0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/i4d0;->c:Ll/v5;

    iget-object p0, p0, Ll/i4d0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/s4d0;->f(Ll/s4d0;Ljava/lang/String;Ll/v5;Ljava/lang/String;)V

    return-void
.end method
