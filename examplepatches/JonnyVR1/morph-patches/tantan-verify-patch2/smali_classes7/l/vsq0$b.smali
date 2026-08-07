.class Ll/vsq0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vsq0;->f(Ll/vsq0$d;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/vsq0$d;

.field final synthetic b:Ll/vsq0;


# direct methods
.method public constructor <init>(Ll/vsq0;Ll/vsq0$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsq0$b;->b:Ll/vsq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vsq0$b;->a:Ll/vsq0$d;

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
    iget-object v0, p0, Ll/vsq0$b;->b:Ll/vsq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vsq0$b;->a:Ll/vsq0$d;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/vsq0;->e(Ll/vsq0$d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
