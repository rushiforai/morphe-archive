.class public Ll/mai0$c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mai0$c;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/mai0$c;


# direct methods
.method public constructor <init>(Ll/mai0$c;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mai0$c$b;->b:Ll/mai0$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mai0$c$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/mai0$c$b;->b:Ll/mai0$c;

    .line 2
    .line 3
    iget-object p1, p1, Ll/mai0$c;->f:Ll/mai0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/mai0$c$b;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/wc00;->F(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
