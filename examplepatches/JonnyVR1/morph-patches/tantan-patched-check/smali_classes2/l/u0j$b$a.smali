.class public Ll/u0j$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u0j$b;->a(Ll/iye$g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/iye$g;

.field public final synthetic b:Ll/u0j$b;


# direct methods
.method public constructor <init>(Ll/u0j$b;Ll/iye$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u0j$b$a;->b:Ll/u0j$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/u0j$b$a;->a:Ll/iye$g;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u0j$b$a;->b:Ll/u0j$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u0j$b$a;->a:Ll/iye$g;

    .line 4
    .line 5
    iput-object p0, v0, Ll/u0j$b;->h:Ll/iye$g;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/u0j$b;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
