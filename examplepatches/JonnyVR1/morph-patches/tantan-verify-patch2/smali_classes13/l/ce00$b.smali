.class Ll/ce00$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dpl$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ce00;->R(Ll/fb1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/fb1;

.field final synthetic b:Ll/ce00;


# direct methods
.method public constructor <init>(Ll/ce00;Ll/fb1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ce00$b;->b:Ll/ce00;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ce00$b;->a:Ll/fb1;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00$b;->a:Ll/fb1;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
