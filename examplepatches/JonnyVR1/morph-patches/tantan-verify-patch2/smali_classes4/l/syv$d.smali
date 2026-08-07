.class public Ll/syv$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/syv;->p(Ll/b3k0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/b3k0;

.field public final synthetic b:Ll/syv;


# direct methods
.method public constructor <init>(Ll/syv;Ll/b3k0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/syv$d;->b:Ll/syv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/syv$d;->a:Ll/b3k0;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/syv$d;->a:Ll/b3k0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b3k0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
