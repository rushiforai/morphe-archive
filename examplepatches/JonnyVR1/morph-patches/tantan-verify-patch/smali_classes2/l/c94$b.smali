.class public Ll/c94$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/c94;->a(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x0j$c;

.field public final synthetic b:I

.field public final synthetic c:Ll/c94;


# direct methods
.method public constructor <init>(Ll/c94;Ll/x0j$c;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/c94$b;->c:Ll/c94;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c94$b;->a:Ll/x0j$c;

    .line 4
    .line 5
    iput p3, p0, Ll/c94$b;->b:I

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
    iget-object v0, p0, Ll/c94$b;->a:Ll/x0j$c;

    .line 2
    .line 3
    iget p0, p0, Ll/c94$b;->b:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/x0j$c;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
