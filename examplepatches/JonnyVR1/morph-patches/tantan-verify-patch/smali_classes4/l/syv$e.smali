.class public Ll/syv$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/syv;->o(Ll/b3k0;Ljava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/b3k0;

.field public final synthetic b:Ljava/lang/Throwable;

.field public final synthetic c:Ll/syv;


# direct methods
.method public constructor <init>(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/syv$e;->c:Ll/syv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/syv$e;->a:Ll/b3k0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/syv$e;->b:Ljava/lang/Throwable;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/syv$e;->a:Ll/b3k0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/syv$e;->b:Ljava/lang/Throwable;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/b3k0;->b(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
